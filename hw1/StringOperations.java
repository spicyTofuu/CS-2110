//could we use .indexOf() method to declare the indexes of the substring?

public class StringOperations {
	public static void main(String arg[]) {
		String name1="Jiaxuan Chen";
		System.out.println(name1);
		String name2=name1.replace('J','A').replace('n', 'Z');
		System.out.println(name2);
		String URL="www.google.com";
		System.out.println(URL);
		String URL2=URL.substring(URL.length()-10, URL.length()-4).concat("1331");
		System.out.println(URL2);
	}
}
