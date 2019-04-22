package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class CartItem {
	
	private Book book;
	private Integer count;
	private Double subtotal;
	public Double getSubtotal() {
		return book.getDd_price() * count;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
}
