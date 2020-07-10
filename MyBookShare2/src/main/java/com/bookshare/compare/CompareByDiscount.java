package com.bookshare.compare;

import java.util.Comparator;

import com.bookshare.model.BookVO;

public class CompareByDiscount implements Comparator<BookVO> {

	@Override
	public int compare(BookVO o1, BookVO o2) {
		if(o1.getDiscount() > o2.getDiscount())
			return 1;
		else if(o1.getDiscount() < o2.getDiscount())
			return -1;
		else
			return 0;
	}

	
}
