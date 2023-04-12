package kr.co.reserve.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Room {
private int roomNo; 
private String roomType;
private int max;
private List<Attached> img;
private int price;


}
