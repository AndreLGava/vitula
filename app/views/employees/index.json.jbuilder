json.array!(@employees) do |employee|
  json.extract! employee, :id, :work, :name, :startwork, :endwork, :born, :phone, :rg, :cpf, :schooling, :inss, :pis, :salary, :profession, :payment, :property_id
  json.url employee_url(employee, format: :json)
end
