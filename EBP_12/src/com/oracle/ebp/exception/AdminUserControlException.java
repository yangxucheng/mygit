package com.oracle.ebp.exception;

public class AdminUserControlException extends Exception{
	public AdminUserControlException() {
	}

	public AdminUserControlException(String message, Throwable cause) {
		super(message, cause);
	}

	public AdminUserControlException(String message) {
		super(message);
	}
}
