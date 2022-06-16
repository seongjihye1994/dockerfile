FROM ubuntu:20.04
RUN apt update && apt install -y python3
# 도커파일 안에서 운영체제의 명령어를 실행시키려면 run 사용
WORKDIR /var/www/html
# 이 디렉토리가 없다면, 디렉토리를 만들고, 사용자를 이 디렉토리로 이동시키고, 이후부터는 모든 명령어는 이 워크디렉토리에서 실행된다.
RUN echo "Hello, <strong>Docker</strong>" > index.html
COPY ["index.html", "."]
# host(컴퓨터)에 있는 index.html을 /var/www/html 로 복사
# 도커파일에의해 만들어진 이미지가 컨테이너로 생성될 때 python3 -m http.server 명령어가 자동으로 실행됐으면 좋겠다.
CMD ["python3", "-u", "-m", "http.server"]
# run은 빌드가 되는 시점에 실행되는 명령어 -> 이미지에 반영
# cmd는 컨테이너가 실행될 때 실행되는 명령어 -> 컨테이너에 반영
