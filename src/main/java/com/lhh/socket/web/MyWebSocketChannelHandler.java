package com.lhh.socket.web;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.stream.ChunkedWriteHandler;

/**
 * 初始化连接时候的各个组件
 * @author Administrator
 *
 */
public class MyWebSocketChannelHandler extends ChannelInitializer<SocketChannel>{

	@Override
	protected void initChannel(SocketChannel sc) throws Exception {
		sc.pipeline().addLast("http-codec",new HttpServerCodec());
		sc.pipeline().addLast("aggregator",new HttpObjectAggregator(65535));
		sc.pipeline().addLast("http-chunked",new ChunkedWriteHandler());
		sc.pipeline().addLast("handler",new MyWebSocketHandler());
	}

}
