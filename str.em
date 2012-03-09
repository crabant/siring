//Siring - str.em
//                                         
//Copyright (C) 2012 Crabant Yang
//                                         
//This file is part of Siring.                                                       
//                                                                                   
//    Siring is free software: you can redistribute it and/or modify                 
//    it under the terms of the GNU General Public License as published by           
//    the Free Software Foundation, either version 3 of the License, or              
//    (at your option) any later version.                                            
//                                                                                   
//    Siring is distributed in the hope that it will be useful,                      
//    but WITHOUT ANY WARRANTY; without even the implied warranty of                 
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                  
//    GNU General Public License for more details.                                   
//                                                                                   
//    You should have received a copy of the GNU General Public License              
//    along with Siring.  If not, see <http://www.gnu.org/licenses/>.

macro strchr( s, c)
{
	var len
		var i
		len = strlen( s)
		i = 0
		while( i < len)
		{
			if( c == s[i])
				return i;
			i = i + 1
		}
		return -1;
}

macro strrchr( s, c)
{
	var len
		var i
		len = strlen( s)
		i = len -1
		while( i >= 0)
		{
			if( c == s[i])
				return i;
			i = i - 1
		}
		return -1;
}
macro strchrn( s, c, b)
{
	var len
		var i
		len = strlen( s)
		i = b
		while( i < len)
		{
			if( c == strmid( s, i, i+1))
				return i;
			i = i + 1
		}
		return -1;
}

macro split( s, c)
{
	var len
		var i
		len = strlen( s)
		i = 0

		var buf
		buf = NewBuf()

		var index
		index = 0
		var s
		s = ""
		while( i < len)
		{
			if( c == strmid( s, i, i+1))
			{
				if( i != 0)
				{
					AppendBufLine( buf,  s)
				}
				if( i == len -1)
					return buf
			}
			s = cat( s, c)
				i = i + 1
		}
		AppendBufLine( buf,  s)
			return buf
}

