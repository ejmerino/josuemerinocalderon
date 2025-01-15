package com.espe.serverrmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IHelloService extends Remote {


    String sayHello(String name) throws RemoteException;
}
