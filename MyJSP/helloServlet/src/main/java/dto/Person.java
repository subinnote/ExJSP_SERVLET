package dto;

public class Person {
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	private int age;	
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
