sudo socat TCP-LISTEN:1337,reuseaddr,fork EXEC:"./shimon.sh -s",pty,stderr,setsid,sigint,sane
