
docker run \
    --rm \
    -t \
    -v /$PWD/example.graphql:/example.graphql \
    symm/graphql-contract-test:latest \
    http://mac-asantos.local:9002/graphql /example.graphql