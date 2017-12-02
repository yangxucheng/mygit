package com.oracle.ebp.exception;

public class RegisterException  extends Exception {
    public RegisterException(Exception e) {
        super(e);
    }
    public RegisterException(String msg) {
        super(msg);
    }
}
