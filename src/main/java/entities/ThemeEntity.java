package entities;

import jakarta.persistence.Entity;

@Entity
@jakarta.persistence.Table(name = "Theme", schema = "Database_Jakarta_Project", catalog = "")
public class ThemeEntity {
	@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
	@jakarta.persistence.Id
	@jakarta.persistence.Column(name = "themeId", nullable = false)
	private int themeId;

	public int getThemeId() {
		return themeId;
	}

	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "themeName", nullable = false, length = 50)
	private String themeName;

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
}
