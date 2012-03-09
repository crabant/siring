//Siring - cpp.em
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


macro err_not_support()
{
	var buf 
	buf = GetCurrentBuf()
	var filename 
	filename = GetBufName( buf)
	var err
	err = cat(filename, " does not support switch")
	msg( err)
	stop
}

macro getSwitchToFile( buf,ntime)
{
	var filename

	//buf = GetCurrentBuf()
	filename = GetBufName( buf)

	var pos1
	var pos2
	var ext
	pos1 = strrchr( filename, "\\")
	pos2 = strrchr( filename, ".")
	ext = strmid( filename, pos2+1, strlen( filename))
	filename = strmid( filename, pos1+1, pos2);
	filename = cat( filename, ".")

	if( ntime == 0)
	{
		if( ext == "cpp")
		{
			filename = cat( filename, "h")
		}
	}
	else if( ntime == 1)
	{
		if( ext == "h")
		{
			filename = cat( filename, "cpp")
		}
	}
	else if( ntime== 2)
	{
		if( ext == "cc"
		{
			filename = cat( filename, "h")
		}
	} 
	else if( ntime== 3)
	{
		if( ext == "h"
		{
			filename = cat( filename, "cc")
		}
	}
	else if( ntime== 4)
	{
		if( ext == "inl"
		{
			filename = cat( filename, "h")
		}
	}
	else if( ntime== 5)
	{
		if( ext == "h"
		{
			filename = cat( filename, "inl")
		}
	}
	else if( ntime== 6)
	{
		if( ext == "h"
		{
			filename = cat( filename, "c")
		}
	}
	else if( ntime== 7)
	{
		if( ext == "c"
		{
			filename = cat( filename, "h")
		}
	}
	else
	{
		err_not_support()
	}
	return filename
}



macro try_open( filename)
{
	var buf 
	var res
	buf = OpenBuf( filename)
	if( buf != hNil)
	{
		//buf = OpenBuf( filename)
		SetCurrentBuf( buf)
			//stop
			res = True
	}
	else
	{
		res = False
	}
	return res
}

macro switch()
{
	var curbuf
	var filename
	var i
	var count
	var res
	curbuf = GetCurrentBuf()
	if(hNil == curbuf)
	{
		stop
	}
	i = 0
	count = 0
	while( i < 8)
	{
		filename = getSwitchToFile(curbuf,i)
		res = try_open( filename) 
		if( res )
		{
			count = count + 1
		}
		i = i + 1

	}
	if(1 < count)
	{
		//RunCmd("Tile Two Windows")
		runcmd("Window List")
	}
	if(0 == count)
		err_not_support()
}





//not used in this case, but it show how op project, for files 124, the efficiency is good
macro openSwitchFile( fileto)
{
	var hprj
	hprj = GetCurrentProj ()
	var count
	count = GetProjFileCount (hprj)

	var i
	i = 0
	var filename
	while( i < count)
	{
		filename = GetProjFileName( hprj, i)
		if( fileto == filename)
		{
			var buf
			buf = OpenBuf( filename)
			SetCurrentBuf( buf)
			stop
		}
		i = i + 1
	}
	var err
	err = cat("can not find the file ", fileto)
	msg( err)
	stop
}

