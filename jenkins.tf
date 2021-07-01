resource "kubernetes_namespace" "jenkins" {
  metadata {
    annotations = {
      name = "jenkins"
    }

    labels = {
      mylabel = "jenkins"
    }

    name = "jenkins"
  }
}