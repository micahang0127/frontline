package com.frontline.newssummary.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
 
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
@ServerEndpoint("/summaryPage")//클라에서 서버로 접속할 주소
public class BroadSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnMessage//클라로부터 메세지가 도착했을때
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnOpen //클라에서 서버로 접속했을때
    public void onOpen(Session session) {
        System.out.println(session);
        clients.add(session);
    }
    
    @OnClose // 접속이 끊겼을때
    public void onClose(Session session) {
        clients.remove(session);
    }
}
