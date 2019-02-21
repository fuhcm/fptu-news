ssh root@54.179.166.164 <<EOF
    cd /home/fptu-news
    git checkout .
    git pull
    sudo docker build -t fptu-news .
    docker stop fptu-news
    docker rm fptu-news
    docker run -d --name fptu-news -p 1002:80 fptu-news:latest
    exit
EOF