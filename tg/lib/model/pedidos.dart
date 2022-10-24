class Pedidos {
  int? idPedido;
  String? cpf;
  String? nomeCliente;
  int? statusPedido;
  String? dataInsercao;
  List<Produtos>? produtos;
  Pedidos({this.cpf, this.idPedido, this.nomeCliente, this.produtos, this.statusPedido, this.dataInsercao});
}

class Produtos {
  int? idProduto;
  String? nomeProduto;
  int? quantidadePedida;
  int? statusProdutos;
  String? tempoPreparo;

  Produtos({this.idProduto, this.nomeProduto, this.quantidadePedida, this.statusProdutos, this.tempoPreparo});
}
