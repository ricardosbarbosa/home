class Servico < ActiveRecord::Base

  FILTERS = [
      {:scope => "all",         :label => "All"},
      {:scope => "active",      :label => "Active"},
      {:scope => "inactive",    :label => "Inactive"},
      {:scope => "visible",     :label => "Visible"},
      {:scope => "invisible",   :label => "Not Visible"},
      {:scope => "high_rated",  :label => "High-Rated"},
      {:scope => "low_rated",   :label => "Low-Rated"}
  ]

  attr_accessible :detalhes, :endereco, :nome, :regiao, :telefone, :tipo

  def self.all_regioes
    find_by_sql("SELECT regiao FROM servicos GROUP BY regiao ORDER BY regiao ").map(&:regiao).select {|x| x}
  end

  def self.all_tipos
    find_by_sql("SELECT tipo FROM servicos GROUP BY tipo ORDER BY tipo").map(&:tipo).select {|x| x}
  end

  def self.select(regiao, tipo)
    if regiao and tipo and not regiao.eql? "Todos"and not tipo.eql? "Todos"
      where(:regiao => regiao, :tipo => tipo)
    elsif regiao and not regiao.eql? "Todos"
      find_all_by_regiao(regiao)
    elsif tipo and not tipo.eql? "Todos"
      find_all_by_tipo(tipo)
    else
      find :all
    end
  end
end
