# Ubuntu SSH Daemon Image for Whale

`ssal` 서버에 설치된 [Whale](https://whale.sparcs.org)에서 회원들에게 제공할 수 있는 `ubuntu` 환경을 만들기 위한 docker 파일입니다.
Newbie project 등에 사용됩니다. 

## Managing the container

### Create/Restart
```bash
make up
```

컨테이너를 처음 생성한 다음에는 사용할 포트(`22`번 포트 포함)를 직접 포워딩해 주어야 합니다.
`proxy` docker network에 연결된 `ssal` 서버의 [Node Proxy Manager](https://nginx.ssal.sparcs.org)에서 가능합니다.

### Terminate

```bash
make down
```

## Using the container

유저 `root`와 초기 비밀번호 `tnfqkrtm`으로 컨테이너에 SSH 접속이 가능합니다. 홈 디렉토리의 `./changepw` 스크립트로 비밀번호를 변경할 수 있습니다. 

