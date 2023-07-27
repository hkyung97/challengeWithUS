package com.smart.home.dto;

import lombok.Data;

public class MemberDTO {
	private String memberId; // 아이디
	private String memberName; // 이름
	private String memberGender; // 성별
	private String memberPwd; // 비밀번호
	private String memberEmail; // 이메일
	private String memberTel; // 연락처
	private String memberAddr; // 주소
	private String memberBirth; // 생년월일

	private String zipcodeSub;
	public String getZipcodeSub() {
		return zipcodeSub;
	}

	public void setZipcodeSub(String zipcodeSub) {
		this.zipcodeSub = zipcodeSub;
	}

	private String zipcode;
	private String streetAdr;
	private String detailAdr;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String zipcode, String zipcodeSub, String streetAdr, String detailAdr) {

		this.zipcode = zipcode;
		this.streetAdr = streetAdr;
		this.detailAdr = detailAdr;
		this.zipcodeSub = zipcodeSub;
		this.memberAddr = zipcode + " " + zipcodeSub + " " + streetAdr + " " + detailAdr;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getStreetAdr() {
		return streetAdr;
	}

	public void setStreetAdr(String streetAdr) {
		this.streetAdr = streetAdr;
	}

	public String getDetailAdr() {
		return detailAdr;
	}

	public void setDetailAdr(String detailAdr) {
		this.detailAdr = detailAdr;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", memberName=" + memberName + ", memberGender=" + memberGender
				+ ", memberPwd=" + memberPwd + ", memberEmail=" + memberEmail + ", memberTel=" + memberTel
				+ ", memberAddr=" + memberAddr + ", memberBirth=" + memberBirth + ", zipcode=" + zipcode
				+ ", streetAdr=" + streetAdr + ", detailAdr=" + detailAdr + "]";
	}
	
	
}
