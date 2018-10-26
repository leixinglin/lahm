package com.lhh.socket.web;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class Main {
	public static void main(String[] args) {
	
		EventLoopGroup bossGroup=new NioEventLoopGroup();
		EventLoopGroup workGroup=new NioEventLoopGroup();
		try{
			ServerBootstrap sb=new ServerBootstrap();
			sb.group(bossGroup,workGroup);
			sb.channel(NioServerSocketChannel.class);
			sb.childHandler(new MyWebSocketChannelHandler());
			System.out.println("服务端开启，等待客户端连接");
			Channel c=sb.bind(8666).sync().channel();
			c.closeFuture().sync();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			bossGroup.shutdownGracefully();
			workGroup.shutdownGracefully();
		}
	}
		
	
}
