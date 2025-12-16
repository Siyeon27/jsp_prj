package kr.co.sist.siteProperty;

/**
 * 사이트의 설정정보를 가지는 객체.
 */
public class SitePropertyVO {
	private String protocol,	server_name,	context_root,	
	manage_path,	key,	title;

	public SitePropertyVO(String protocol, String server_name, String context_root, String manage_path, String key,
			String title) {
		this.protocol = protocol;
		this.server_name = server_name;
		this.context_root = context_root;
		this.manage_path = manage_path;
		this.key = key;
		this.title = title;
	}

	public String getProtocol() {
		return protocol;
	}

	public String getServer_name() {
		return server_name;
	}

	public String getContext_root() {
		return context_root;
	}

	public String getManage_path() {
		return manage_path;
	}

	public String getKey() {
		return key;
	}

	public String getTitle() {
		return title;
	}

	@Override
	public String toString() {
		return "SitePropertyVO [protocol=" + protocol + ", server_name=" + server_name + ", context_root="
				+ context_root + ", manage_path=" + manage_path + ", key=" + key + ", title=" + title + "]";
	}	

}
