docker run \
--rm \
--name graphql-faker \
-p 9002:9002 \
-v /$PWD:/workdir \
apisguru/graphql-faker \
example.graphql