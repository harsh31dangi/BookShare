package com.bookshare.compare;

import java.util.Comparator;

import com.bookshare.model.BookVO;

public class CompareByPrice implements Comparator<BookVO> {

	@Override
	public int compare(BookVO book1, BookVO book2) {
		
			if(book1.getSellingPrice() > book2.getSellingPrice()) 
				return 1;
			else if(book1.getSellingPrice() < book2.getSellingPrice())
				return -1;
			else
				return 0;
	}

}
