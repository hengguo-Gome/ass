/**
 * CENJKServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.gome.ass.service.wsdl.service;

import com.gome.ass.common.CustomizedPropertyPlaceholderConfigurer;

public class CENJKServiceLocator extends org.apache.axis.client.Service implements com.gome.ass.service.wsdl.service.CENJKService {

    public CENJKServiceLocator() {
    }


    public CENJKServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public CENJKServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for CENJK
    private java.lang.String CENJK_address = (String) CustomizedPropertyPlaceholderConfigurer.getContextProperty("orderDelay");

    public java.lang.String getCENJKAddress() {
        return CENJK_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String CENJKWSDDServiceName = "CENJK";

    public java.lang.String getCENJKWSDDServiceName() {
        return CENJKWSDDServiceName;
    }

    public void setCENJKWSDDServiceName(java.lang.String name) {
        CENJKWSDDServiceName = name;
    }

    public com.gome.ass.service.wsdl.service.CENJK getCENJK() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(CENJK_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getCENJK(endpoint);
    }

    public com.gome.ass.service.wsdl.service.CENJK getCENJK(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.gome.ass.service.wsdl.service.CENJKSoapBindingStub _stub = new com.gome.ass.service.wsdl.service.CENJKSoapBindingStub(portAddress, this);
            _stub.setPortName(getCENJKWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setCENJKEndpointAddress(java.lang.String address) {
        CENJK_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.gome.ass.service.wsdl.service.CENJK.class.isAssignableFrom(serviceEndpointInterface)) {
                com.gome.ass.service.wsdl.service.CENJKSoapBindingStub _stub = new com.gome.ass.service.wsdl.service.CENJKSoapBindingStub(new java.net.URL(CENJK_address), this);
                _stub.setPortName(getCENJKWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("CENJK".equals(inputPortName)) {
            return getCENJK();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://wwxtjk.jlmd.jlscm.jlserver", "CENJKService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://wwxtjk.jlmd.jlscm.jlserver", "CENJK"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("CENJK".equals(portName)) {
            setCENJKEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
