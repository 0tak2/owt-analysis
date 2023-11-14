# OWT 띄워보기

분석을 위해 OWT를 빌드하고 띄워볼 수 있는 도커 이미지입니다.

```bash
docker build -t owt-original .
docker compose up -d

# Verbose (출력 내용을 보고 싶은 경우)
docker build -t owt-original . --progress=plain
docker compose up
```

완료되면 웹브라우저로 [https://localhost:3004](https://localhost:3004) 접속

## 참고

* [owt-server](https://github.com/open-webrtc-toolkit/owt-server)
* [owt-client-javascript](https://github.com/open-webrtc-toolkit/owt-client-javascript)
