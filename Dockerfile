FROM alpine
ADD route /route

ENV KUBECONFIG=/root/.kube/config

ENTRYPOINT [ "/route" ]