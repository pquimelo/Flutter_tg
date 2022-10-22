class Pedidos {
  int? idPedido;
  String? cpf;
  String? nomeCliente;
  List<Produtos>? produtos;
  Pedidos({this.cpf, this.idPedido, this.nomeCliente, this.produtos});
}

class Produtos {
  int? idProduto;
  String? nomeProduto;
  int? quantidadePedida;

  Produtos({this.idProduto, this.nomeProduto, this.quantidadePedida});
}
