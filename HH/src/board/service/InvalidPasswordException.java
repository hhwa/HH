package board.service;

public class InvalidPasswordException extends Exception{
	public InvalidPasswordException(String msg) {
		super(msg);
	}
}
