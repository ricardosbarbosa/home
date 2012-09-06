#encoding: utf-8
class HomeController < ApplicationController
  #layout 'brlayout'
  layout 'application'

  #TODO passar esses caras para Brcobranca::Boleto::Base
  FORMATOS_SUPORTADOS={
    :pdf => 'application/pdf',
    :jpg => 'image/jpg',
    :tif => 'image/tiff',
    :png => 'image/png'
  }

  def gerar_boleto
    banco=params[:banco].to_sym

    @boleto = case banco
    when :itau then Brcobranca::Boleto::Itau.new
    when :bb then  Brcobranca::Boleto::BancoBrasil.new
    when :hsbc then Brcobranca::Boleto::Hsbc.new
    when :real then Brcobranca::Boleto::Real.new
    when :bradesco then Brcobranca::Boleto::Bradesco.new
    when :unibanco then Brcobranca::Boleto::Unibanco.new
    when :caixa then Brcobranca::Boleto::Caixa.new
    end

    #dados do condominio
    residencial = current_user.apartamento.residencial

    @boleto.cedente = residencial.nome  #dados do conominio
    @boleto.documento_cedente = residencial.cnpj
    @boleto.agencia = residencial.agencia
    @boleto.conta_corrente = residencial.conta

    # dados do condomino (usuario logado)
    @boleto.sacado = current_user.email  #condomino
    @boleto.sacado_documento = "????"

    @boleto.valor = 600.00


    case banco
    when :itau
      # ITAU
      # O que diferencia um tipo de boleto de outro, dentro do itáu é o tipo de carteira utilizado.
      @boleto.convenio = "12345"
      @boleto.numero_documento = "102008"
    when :bb
      # BB
      # O que diferencia um tipo de boleto de outro, dentro do Banco do Brasil é a quantidade de dígitos do convênio.
      @boleto.convenio = "1238798"
      @boleto.numero_documento = "7777700168"
    when :hsbc
      # HSBC
      # O que diferencia um tipo de boleto de outro, dentro do HSBC é a quantidade de dígitos do número do documento.
      @boleto.numero_documento = "102008"
    when :unibanco
      # UNIBANCO
      @boleto.convenio = "1238798"
      @boleto.numero_documento = "7777700168"
    when :caixa
      # CAIXA
      @boleto.agencia = "1565"
      @boleto.numero_documento = "123456789123456"
      @boleto.conta_corrente = "0013877"
      @boleto.convenio = "100000"
    else
      @boleto.convenio = "1238798"
      @boleto.numero_documento = "102008"
    end

    @boleto.dias_vencimento = 5
    @boleto.data_documento = "2008-02-01".to_date
    @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
    @boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)"
    @boleto.instrucao3 = "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006"
    @boleto.instrucao4 = "NÃO RECEBER APÓS 15/11/2006"
    @boleto.instrucao5 = "Após vencimento pagável somente nas agências do Banco do Brasil"
    @boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO"
    @boleto.sacado_endereco = "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"

    formato=params[:boleto][:formato].to_sym
    headers['Content-Type']=FORMATOS_SUPORTADOS[formato]
    send_data @boleto.to(formato), :filename => "boleto_#{banco}.#{formato}"
  end

  def index
    @formatos=FORMATOS_SUPORTADOS.keys.map{|v| v.to_s}.sort.map{|v| [v,v]}.sort
  end

  def boleto_hash
    residencial = current_user.apartamento.residencial
    @boleto = Brcobranca::Boleto::BancoBrasil.new :cedente => residencial.nome,
    :documento_cedente => residencial.cnpj,
    :sacado => current_user.email,
    :sacado_documento => "????",
    :valor => 135.00,
    :agencia => "4042",
    :conta_corrente => "61900",
    :convenio => "1238798",
    :numero_documento => "7777700168",
    :dias_vencimento => 5,
    :data_documento => "2008-02-01".to_date,
    :instrucao1 => "Pagável na rede bancária até a data de vencimento.",
    :instrucao2 => "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)",
    :instrucao3 => "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006",
    :instrucao4 => "NÃO RECEBER APÓS 15/11/2006",
    :instrucao5 => "Após vencimento pagável somente nas agências do Banco do Brasil",
    :instrucao6 => "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO",
    :sacado_endereco => "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"

    send_data @boleto.to_pdf, :filename => "boleto_hash.pdf"
  end

  def boleto_em_bloco
    @boleto = Brcobranca::Boleto::BancoBrasil.new do |boleto|
      boleto.cedente = "Kivanio Barbosa",
      boleto.documento_cedente = "12345678912",
      boleto.sacado = "Claudio Pozzebom",
      boleto.sacado_documento = "12345678900",
      boleto.valor = 135.00,
      boleto.agencia = "4042",
      boleto.conta_corrente = "61900",
      boleto.convenio = "1238798",
      boleto.numero_documento = "7777700168",
      boleto.dias_vencimento = 5,
      boleto.data_documento = "2008-02-01".to_date,
      boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento.",
      boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)",
      boleto.instrucao3 = "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006",
      boleto.instrucao4 = "NÃO RECEBER APÓS 15/11/2006",
      boleto.instrucao5 = "Após vencimento pagável somente nas agências do Banco do Brasil",
      boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO",
      boleto.sacado_endereco = "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"
    end

    send_data @boleto.to_pdf, :filename => "boleto_em_bloco.pdf"
  end


  def multi_boleto
    boleto_dados = {:cedente => "Kivanio Barbosa",
      :documento_cedente => "12345678912",
      :sacado => "Claudio Pozzebom",
      :sacado_documento => "12345678900",
      :valor => 135.00,
      :agencia => "4042",
      :conta_corrente => "61900",
      :convenio => "1238798",
      :numero_documento => "7777700168",
      :dias_vencimento => 5,
      :data_documento => "2008-02-01".to_date,
      :instrucao1 => "Pagável na rede bancária até a data de vencimento.",
      :instrucao2 => "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)",
      :instrucao3 => "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006",
      :instrucao4 => "NÃO RECEBER APÓS 15/11/2006",
      :instrucao5 => "Após vencimento pagável somente nas agências do Banco do Brasil",
      :instrucao6 => "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO",
      :sacado_endereco => "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"}

      @boletos = []
      @boleto = Brcobranca::Boleto::BancoBrasil.new(boleto_dados)
      @boleto2 = Brcobranca::Boleto::Bradesco.new(boleto_dados)
      @boletos << @boleto
      @boletos << @boleto2

      send_data Brcobranca::Boleto::Base.lote(@boletos), :filename => "multi_boleto.pdf"
    end

  end
