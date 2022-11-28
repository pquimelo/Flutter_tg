class Pedidos {
  int? idPedido;
  String? cpf;
  String? nomeCliente;
  int? statusPedido;
  String? dataInsercao;
  List<Produtos>? produtos;
  Pedidos({this.cpf, this.idPedido, this.nomeCliente, this.produtos, this.statusPedido, this.dataInsercao});

  Pedidos.fromJson(Map<String, dynamic> json)
      : idPedido = json['id_order'],
        cpf = json['user']['cpf'],
        nomeCliente = json['user']['name'],
        statusPedido = json['status'],
        dataInsercao = json['insertion_date'];

  Map<String, dynamic> toJson() => {
        'id_order': idPedido,
      };
  //TODO: PERGUNTAR PRO RAFA COMO PEGAR O JSON E TRANSFORMAR PARA USAR E VICE VERSA
}

class Produtos {
  int? idProduto;
  String? nomeProduto;
  int? quantidadePedida;
  int? statusProdutos;
  String? tempoPreparo;
  int? prioridade;

  Produtos({
    this.idProduto,
    this.nomeProduto,
    this.quantidadePedida,
    this.statusProdutos,
    this.tempoPreparo,
    this.prioridade,
  });
}
