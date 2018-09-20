% Creates output dir


if exist( 'outputdir' ) == 0
  outputdir = [ './output/' supName '/' ] ;
end

if exist( '/output/' ) ~= 7
  fprintf( '  Creating directory ./output/ ...\n' );
  mkdir('./', './output/' );
  cd output

  if exist( ['./' supName '/' ] ) ~= 7
    fprintf( ['  Creating directory ./output/' supName '/ ...\n'] );
    mkdir('./', ['./' supName '/' ] );
  end  
  cd ..
end