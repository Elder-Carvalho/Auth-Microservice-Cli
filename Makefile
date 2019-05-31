build:
	protoc -I. --twirp_out=. --go_out=. proto/auth/auth.proto
	sudo docker build -t auth-cli .