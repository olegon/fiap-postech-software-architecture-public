# Desafio individual - Kubernetes Parte 2

Basicamente, estou rodando uma simples página em um *nginx* que usa um backend *nodejs* para consultar ou alterar uma informação que está em um *redis*.

Para observabilidade, foi configurado um *EFK Stack (Elasticsearch, Fluentd e Kibana)*.

## Scripts

- [Rodando apps no Docker Compose](./util-run-with-docker-compose.sh)
- [Configurar Kubernetes local](./util-setup-minikube.sh)
- [Rodando apps Kubernetes local](./util-run-with-minikube.sh)
- [Expondo aplicações rodando no Kubernetes local](./util-expose-minikube.sh)
- [Rodando testes de estresse](./util-run-k6.sh)

## Objetivos da parte 1

- [x] Criar ConfigMap
- [x] Criar Deployment
- [x] Configurar Probes
- [x] Configurar gerenciamento de logs
    - Estou avaliando o uso de *fluentd*;
    - Basicamente, é um DaemonSet que captura logs do nó e envia para um lugar centralizado;
    - Docs: https://docs.fluentd.org/configuration/config-file

## Objetivos da parte 2

- [x] Projeto em docker;
- [x] Arquivo .yaml da aplicação;
- [x] Arquivo .yaml service (NodePort);
  - Não usei NodePort porque ele não funciona corretamente com minikube usando driver de docker. No caso, criei como ClusterIp e executei um `kubectl port-forward services/backend 3000:80 > /dev/null &`;
- [x] Arquivo .yaml para a base de dados;

## Objetivos extras

- [ ] Grafana
- [ ] Prometheus
- [ ] Explorar mais o EKS CDK, [diretório](./eks-cdk/README.md)
