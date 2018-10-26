package com.lhh.socket.web;

import java.nio.charset.Charset;
import java.util.Date;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpResponseStatus;
import io.netty.handler.codec.http.HttpVersion;
import io.netty.handler.codec.http.websocketx.CloseWebSocketFrame;
import io.netty.handler.codec.http.websocketx.PingWebSocketFrame;
import io.netty.handler.codec.http.websocketx.PongWebSocketFrame;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshaker;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshakerFactory;
import io.netty.util.CharsetUtil;

public class MyWebSocketHandler extends SimpleChannelInboundHandler<Object>{

	private WebSocketServerHandshaker handShaker;
	private static final String WEB_SOCKET_URL="ws://localhost:8666/web";
	
	/**
	 * 服务端处理客户端请求的核心方法
	 *
	 */
	@Override
	protected void messageReceived(ChannelHandlerContext context, Object msg) throws Exception {
		if(msg instanceof FullHttpRequest){
			handHttpRequest(context,(FullHttpRequest)msg);
		}else if(msg instanceof WebSocketFrame){
			handWebSocketFrame(context,(WebSocketFrame)msg);
		}
	}
	
	private void handWebSocketFrame(ChannelHandlerContext ctx,WebSocketFrame frame){
		if(frame instanceof CloseWebSocketFrame){
			handShaker.close(ctx.channel(), (CloseWebSocketFrame)frame.retain());
		}
		if(frame instanceof PingWebSocketFrame){
			ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
		}
		if(!(frame instanceof TextWebSocketFrame)){
			System.out.println("目前不支二进制消息");
			return;
			//throw new RuntimeException("["+this.getClass().getName()+"]不支持消息");
		}
		String request=((TextWebSocketFrame)frame).text();
		System.out.println("服务端收到消息："+request);
		TextWebSocketFrame tws=new TextWebSocketFrame(new Date().toString()+
				ctx.channel().id()+"====>"+request);
		
		//群发
		NettyConfig.group.writeAndFlush(tws);
	}
	private void handHttpRequest(ChannelHandlerContext ctx,FullHttpRequest request){
		if(!request.getDecoderResult().isSuccess()||!("websocket".equals(request.headers().get("Upgrade")))){
			sendHttpResponse(ctx, request, new DefaultFullHttpResponse(HttpVersion.HTTP_1_1, HttpResponseStatus.BAD_REQUEST));
			return;
		}
		WebSocketServerHandshakerFactory wsFactory=new WebSocketServerHandshakerFactory(WEB_SOCKET_URL, null,false);
		handShaker=wsFactory.newHandshaker(request);
		if(handShaker==null){
			WebSocketServerHandshakerFactory.sendUnsupportedWebSocketVersionResponse(ctx.channel());
		}else{
			handShaker.handshake(ctx.channel(), request);
		}
	}
	
	/**
	 * 服务端向客户端响应消息
	 * @param ctx
	 * @param request
	 * @param response
	 */
	private void sendHttpResponse(ChannelHandlerContext ctx,FullHttpRequest request,
			DefaultFullHttpResponse response
			){
		if(!request.getDecoderResult().isSuccess()){
			ByteBuf buf=Unpooled.copiedBuffer(request.getDecoderResult().toString(),CharsetUtil.UTF_8);
			request.content().writeBytes(buf);
			buf.release();
		}
		//服务端向客户端发送数据
		ChannelFuture f=ctx.channel().writeAndFlush(request);
		if(!request.getDecoderResult().isSuccess()){
			f.addListeners(ChannelFutureListener.CLOSE);
		}
	}

	/**
	 * 客户端与服务端创建链接时调用
	 */
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		NettyConfig.group.add(ctx.channel());
		System.out.println("客户端与服务端创建连接成功！");
	}

	/**
	 * 客户端与服务端断开链接时调用
	 */
	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		NettyConfig.group.remove(ctx.channel());
		System.out.println("客户端与服务端断开连接！");
	}

	/**
	 * 服务端接受客户端传输数据后调用
	 */
	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	/**
	 * 工程出现异常时调用
	 */
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		// TODO Auto-generated method stub
		cause.printStackTrace();
		ctx.close();
	}

}
