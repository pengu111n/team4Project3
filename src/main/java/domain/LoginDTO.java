package domain;

import lombok.Data;

@Data
public class LoginDTO {
    private String id;
    private String pw;
    private boolean useCookie;
}
