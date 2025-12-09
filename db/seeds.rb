# Seeds para o modelo Job

# Exemplos de vagas com salário como string (campo `salario` no schema)
jobs = [
	{ job: 'Desenvolvedor Rails', salario: 'R$ 8.000' },
	{ job: 'Desenvolvedor Front-end', salario: 'R$ 7.000' },
	{ job: 'Analista de QA', salario: 'R$ 5.000' },
	{ job: 'Gerente de Produto', salario: 'R$ 12.000' },
	{ job: 'Estagiário', salario: 'R$ 1.500' }
]

jobs.each do |attrs|
	Job.find_or_create_by(job: attrs[:job]) do |j|
		j.salario = attrs[:salario]
	end
end

puts "Seeds completadas: #{Job.count} jobs cadastrados"
