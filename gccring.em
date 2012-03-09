//Siring - gccring.em
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


macro gccring()
{
	var hBuf
	var filename
	
	var hprj
	hprj = GetCurrentProj ()
	if(hprj==hNil)
	{
		msg("none project found")
		stop
	}

	filename=ask("input config file full name")	
	hBuf = OpenBuf( filename)
	if(hBuf==hNil)
	{
		msg("open failed")
		stop
	}
	var count
	count=GetBufLineCount(hBuf)
	var i
	i=0
	var line
	EmptyProj(hprj)
	while(i<count)
	{
		line=GetBufLine(hBuf,i)
		if(0<strlen(line))
		{
			AddFileToProj(hprj,line)
		}
		i=i+1
	}

	CloseBuf(hBuf)
	SyncProj(hprj)
}

macro gccring_add()
{
	var hBuf
	var filename
	
	var hprj
	hprj = GetCurrentProj ()
	if(hprj==hNil)
	{
		msg("none project found")
		stop
	}

	filename=ask("input config file full name")	
	hBuf = OpenBuf( filename)
	if(hBuf==hNil)
	{
		msg("open failed")
		stop
	}
	var count
	count=GetBufLineCount(hBuf)
	var i
	i=0
	var line
	while(i<count)
	{
		line=GetBufLine(hBuf,i)
		if(0<strlen(line))
		{
			AddFileToProj(hprj,line)
		}
		i=i+1
	}

	CloseBuf(hBuf)
	SyncProj(hprj)
}



