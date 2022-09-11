TRUNCATE TABLE Pessoa, Cliente, Endereco, Pessoa_Endereco, Funcionario, Veiculo, Pessoa_Veiculo, Servico,Atividade,Servico_Atividade,Ordem_Servico,Pagamento,Atividades_Realizadas restart identity cascade;

INSERT INTO Pessoa(cpf, first_name, last_name, rg, telefone)
VALUES ('11111111111', 'Gian', 'Luca','0215478','87932620733'),
('22222222222', 'Isaura', 'Albino', '7841202','87926426152'),
('33333333333', 'Marcelo', 'Pessoa', '0215499','81924645367'),
('44444444444', 'Frederico', 'Dias', '2486320','87938764863'),
('55555555555', 'Jessé', 'Rios', '7463001','87925355537'),
('66666666666', 'Soraia', 'Sílvia', '0575210','81925387852'),
('77777777777', 'Gil', 'do Vigor', '7712210', '87924247275'), 
('88888888888', 'Josué ', 'Nogueira', '0548120', '87924187178'), 
('99999999999', 'Victor', 'Amâncio', '3443245', '87924184321'), 
('10023002487', 'Lúcio', 'Constantino', '5498523','87927783583'), 
('12345678910', 'Marcelo', 'Henrique', '0457989', '81938727548'),
('74526981355', 'Paulo', 'Soares', '7527862','87932492657'),
('70224668420', 'Maria', 'Cavalcanti', '4311852','81931846682'),
('78254531587', 'Andréia', 'Cardoso', '2108778','87931387235'),
('61872908712', 'José', 'Bezerra', '7014178', '81936047147'),
('58134596149', 'Augusto', 'Cavalierri','2844562','81938076882'),
('91491835941', 'Horácio', 'Pequeno', '7366527','81933388644'),
('70858116044', 'Melinda', 'Nunes', '8701507','81921063245'),
('16898490151', 'Adriana', 'Moraes', '4614650','87939376796'),
('03248912312', 'Fernando', 'Diniz', '0564883','87938764825'),
('04627642794', 'Gabriel', 'Alves', '7668398','87938252618'),
('58161989462', 'Cristina', 'Sampaio', '3474381','81988632254'),
('97684283146', 'Sérgio', 'Munhoz', '0224578','84996557414'),
('73042750757', 'Agatha', 'Nascimento', '7346559','87999658842'),
('33922485572', 'Melanie', 'Costa', '3025886','74924275668'),
('64379458210', 'Miguel', 'Gordon', '3246588','8198837642'),
('78543202025', 'Adriana', 'Cordeiro', '5782446','21986772448');


INSERT INTO Cliente(cpf_pessoa, tipo) VALUES 
('22222222222','Esporádico'),
('33333333333','Devedor'),
('44444444444','Mal Pagador'),
('55555555555','Especial'),
('66666666666','Mal Pagador'),
('77777777777','Mal Pagador'),
('88888888888','Devedor'),
('10023002487','Esporádico'),
('58134596149','Devedor'),
('91491835941','Esporádico'),
('70858116044','Esporádico'),
('16898490151','Devedor');


INSERT INTO Endereco (logradouro, numero, complemento, bairro) VALUES 
('Rua 13 de Maio', 47, NULL, 'N.S. Aparecida'),
('Avenida Agamenon Magalhães', 198, NULL, 'Centro'),
('R. Irmãos Olga e Idelgarde', 384, 'Residencial Maria América - Casa 35', 'Copo de Cristal'),
('R. Duque de Caxias', 7048, NULL, 'Prado'),
('R. Est. Aléssio J de Oliveira', 50, 'Condomínio Privê - Casa 14','N.S. Graças'),
('R. Oito', 147, NULL, 'Divino Espírito Santo');


INSERT INTO Endereco (logradouro, numero, bairro, cidade, estado) VALUES 
('Rio de Janeiro Apartamentos', 9796, 'Centro', 'Goiânia', 'GO'),
('Avenida Sete de Setembro', 9647, 'Marechal Deodoro', 'Rio Branco', 'AC'),
('Rua 15 de Novembro', 696, 'Cadidá', 'Palmas', 'TO'),
('Avenida Vitória', 8755, 'Vermillion', 'Boa Vista', 'RR');


INSERT INTO Pessoa_Endereco VALUES 
(1,'22222222222'),
(1,'33333333333'),
(2,'55555555555'),
(3,'66666666666'),
(4,'77777777777'),
(5,'88888888888'),
(6,'10023002487'),
(7,'58134596149'),
(8,'91491835941'),
(9,'70858116044'),
(10,'16898490151');


INSERT INTO Funcionario(cpf_pessoa, url_foto, data_admissao, salario, setor, especialidade) VALUES
('74526981355', 'https://img.freepik.com/free-photo/old-man-with-blue-shirt_1187-827.jpg?w=740&t=st=1651777210~exp=1651777810~hmac=b22eb01833f9bfec8a44c385e0fdef7272a5b35b1ccda334095fd053ea3634f6', '2019-04-01', 3500, 'administrativo', 'Reparos Gerais'),
('12345678910', 'https://img.freepik.com/free-photo/smiling-old-casual-man-leather-jacket-with-hands-pockets-standing-against-gray-studio-wall_124865-15299.jpg', '2019-04-01', 2900, 'administrativo', 'Reparos Gerais'),
('78254531587', 'https://img.freepik.com/free-photo/positive-human-reactions-feelings-emotions-charming-elegant-middle-aged-sixty-year-old-female-with-short-gray-hair-with-pleased-smile-her-eyes-full-happiness-joy_343059-2855.jpg?t=st=1651778144~exp=1651778744~hmac=6abbfb4c945f9e260552e4a7abe6b93996ebdb372fab6bcdf11a64ae13ef0831&w=826', '2019-09-30', 2500, 'administrativo', NULL);


INSERT INTO Funcionario(cpf_pessoa, url_foto, data_admissao, setor, especialidade) VALUES
('70224668420', 'https://img.freepik.com/free-photo/cheerful-middle-aged-woman-with-curly-hair_1262-20859.jpg?t=st=1651778144~exp=1651778744~hmac=308ff5defdf2414f43efae601a8c75b54eb3517b8fce344f3b2a6cf01303f847&w=826', '2019-06-25', 'operacional', NULL),
('61872908712', 'https://img.freepik.com/free-photo/friendly-looking-satisfied-happy-handsome-african-american-boyfriend-glasses-with-pierced-nose-tattoos-arm-smiling-joyfully-as-holding-hands-pockets-having-nice-conversation_176420-36130.jpg?t=st=1651777320~exp=1651777920~hmac=f8350568088eb0a88d5a01f00a7235ecfe1e2903ad1d82e4fc3947ecacd776f8&w=826', '2019-11-07', 'operacional', NULL),
('99999999999', 'https://img.freepik.com/free-photo/caucasian-brunette-male-portrait_158595-7921.jpg?t=st=1651777320~exp=1651777920~hmac=c3fa3e42b6b18a95397c80388a6c8e0b66cb721ae2b57712935e062d1812044d&w=360', '2019-04-05', 'operacional', NULL),
('04627642794', 'https://img.freepik.com/free-photo/close-up-portrait-attractive-male-model-color-flash-light_158595-5105.jpg?t=st=1651778784~exp=1651779384~hmac=bffb6ff3ee777dcd0022c5f000538003730959ce48849384bf8c05d331dbe7d9&w=826', '2019-08-19', 'mecanico', 'Troca de Óleo'),
('03248912312', 'https://img.freepik.com/free-photo/young-attractive-handsome-guy-feels-delighted-gladden-amazed_295783-535.jpg?t=st=1651777320~exp=1651777920~hmac=1b73a0e342fb9d870d0753bc420561fdc172464f65de305af38f7895fb3deb58&w=826', '2020-01-21', 'mecanico', 'Alinhamento e Balanceamento'),
('11111111111', 'https://img.freepik.com/free-photo/smiling-businessman-standing-with-arms-folded-isolated-white_231208-13007.jpg?t=st=1651777320~exp=1651777920~hmac=e247bd1d38cfe0e94a62fd8ee9ba2920346837fcd548e5bee39ba792fb30dcf4&w=826', '2020-02-01', 'mecanico', 'Freios'),
('44444444444', 'https://img.freepik.com/free-photo/angry-25-years-old-man-shaking-finger-disapproval-sign-frowning-disappointed-forbid-something-bad-telling-no-standing-against-blue-background_1258-74053.jpg?t=st=1651778034~exp=1651778634~hmac=7021500c13506c6030a25cf6eba5643e4d8d7a5e0283367b5807dbfa4e255bfb&w=826', '2020-03-31', 'mecanico', 'Radiador'),
('58161989462', 'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2021-11-07', 'operacional', NULL),
('97684283146', 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2021-11-01', 'mecanico','Reparos Gerais'),
('73042750757', 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2022-03-14', 'operacional', NULL),
('33922485572', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2022-04-05', 'mecanico','Reparos Gerais'),
('64379458210', 'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2022-04-19', 'operacional', NULL),
('78543202025', 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2022-05-30', 'operacional', NULL);

INSERT INTO Veiculo VALUES 
('AKY0239', 'Chrevolet', 'S10', '2008'),
('HPO8714', 'Chrevolet', 'Prisma', '2009'),
('MOC2078', 'Volkswagen', 'Voyage', '2009'),
('MSY1773', 'Volkswagen', 'Polo', '2012'),
('IGX0662', 'Volkswagen', 'Fox', '2012'),
('LNR6397', 'Fiat', 'Cronos', '2017'),
('MKL3450', 'Fiat', 'Uno', '2017'),
('MZN7512', 'Fiat', 'Siena', '2021'),
('JKC9535', 'Citroën', 'C4 Lounge ', '2017'),
('LCF3004', 'Citroën', 'C3', '2020'),
('HKN8744', 'Fiat', 'Mobi', '2019'),
('JZC2468', 'Honda', 'CG 160 Fan', '2019'),
('GTJ3280', 'Honda', 'CG 160 Cargo', '2020'),
('MWX2694', 'Yamaha', 'FZ1 FAZER 1000', '2018'),
('KEA9871', 'Yamaha', 'FAZER YS150 ED', '2020');


INSERT INTO Pessoa_Veiculo VALUES 
('22222222222','AKY0239'),('33333333333','HPO8714'),
('55555555555','MOC2078'),('66666666666','MSY1773'),
('77777777777','IGX0662'),('88888888888','LNR6397'),
('10023002487','MKL3450'),('91491835941','MZN7512'),
('70858116044','LCF3004'),('16898490151','JKC9535'),
('44444444444', 'HKN8744');


INSERT INTO Unidade_Movel VALUES 
('JZC2468',16,14), ('GTJ3280',14,12), 
('MWX2694',13,6), ('KEA9871',11,8);


INSERT INTO Servico(descricao, custo) VALUES 
('Troca de Óleo de Motor', 150.00), ('Revisão dos Freios', 500.00),
('Manutenção da Embreagem', 650.00), ('Trocar água do radiador', 150.00),
('Troca de filtros', 280.00), ('Balanceamento e Alinhamento', 230.00);


INSERT INTO Atividade(descricao) VALUES 
--Troca de Óleo
('Verificar nível de óleo'),
('Verificar formação de borra no motor'),
('Retirar completamente o óleo'),
('Inserir novo óleo'),
-- Revisão dos Freios/Manutenção de Embreagem
('Verificar integridade dos componentes'),
('Trocar componentes defeituosos'),
--Trocar água do radiador
('Verificar integridade do radiador'),
('Verificar nível de água'),
('Repor água até o nível adequado'),
-- Troca de filtros
('Verificar filtro de combustível'),
('Verificar filtro de ar'),
('Verificar filtro de óleo'),
('Verificar filtro de ar-condicionado'),
('Trocar filtros necessários'),
-- Alinhamento e Balanceamento
('Retirar pneus do veículo'),
('Realizar procedimento estático'),
('Realizar procedimento dinâmico'),
('Reinserir pneus no veículo'),
('Verificar ângulo cáster'),
('Verificar convergência e divergência'),
('Realizar ajustes necessários');


INSERT INTO Servico_Atividade VALUES 
(1,1),(1,2),(1,3),(1,4),
(2,5),(2,6),
(3,5),(3,6),
(4,7),(4,8),(4,9),
(5,10),(5,11),(5,12),(5,13),(5,14),
(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21);


INSERT INTO  Ordem_Servico(placa_veiculo, cpf_cliente, id_supervisor, data_entrada, data_saida, custo_total) VALUES 
('AKY0239','22222222222', 10, '2022-05-21', '2022-05-23',250.47),
('HPO8714','33333333333', 7, '2022-06-21', '2022-06-23', 249.99),
('HKN8744','44444444444', 1, '2022-06-28', '2022-06-30', 230.00),
('MOC2078','55555555555', 2, '2022-06-24', '2022-06-27', 638.00),
('MOC2078','55555555555', 6, '2022-09-06', '2022-09-06', 234.80),
('MSY1773','66666666666', 2, '2022-09-07', '2022-09-12', 206.88),
('IGX0662','77777777777', 9, '2022-08-16', '2022-08-19', 942.66),
('LNR6397','88888888888', 10, '2022-07-19', '2022-07-20', 1035.53),
('MKL3450','10023002487', 3, '2022-07-25', '2022-07-27', 230.00),
('MZN7512','91491835941', 8, '2022-07-12', '2022-07-15', 589.69);


INSERT INTO  Ordem_Servico(placa_veiculo, cpf_cliente, id_supervisor, situacao, data_entrada) VALUES 
('JKC9535','16898490151', 6, 'iniciado', '2022-12-16'),
('AKY0239','22222222222', 7, 'iniciado', '2022-12-17'),
('HPO8714','33333333333', 1, 'iniciado', '2022-12-17'),
('LCF3004','70858116044', 9, 'iniciado', '2022-12-18'),
('HKN8744','44444444444', 8, 'em espera', '2022-12-18');


INSERT INTO Pagamento(codigo_ordem_servico, data_vencimento, data_pagamento, valor_pagamento, parcela, formato) VALUES
(1, '2022-05-23', '2022-05-23', 250.47, 0, 'pix'),
(2, '2022-06-23', '2022-06-23', 99.99, 1, 'débito'),
(2, '2022-07-27', NULL, NULL, 2, NULL),
(2, '2022-08-27', NULL, NULL, 3, NULL),
(3, '2022-06-27', '2022-06-27', 1, 125, 'pix'),
(3, '2022-07-27', '2022-08-30', 2, 125, 'dinheiro'),
(4, '2022-06-27', '2022-06-27', 1, 319, 'crédito'),
(4, '2022-07-27', '2022-06-27', 2, 319, 'crédito'),
(5, '2022-09-06', '2022-09-06', 0, 234.80, 'pix'),
(6, '2022-07-20', '2022-09-02', 1, 350, 'dinheiro'),
(7, '2022-08-16', NULL, NULL, 0, NULL),
(8, '2022-07-20', '2022-06-23', 99.99, 1, 'débito'),
(8, '2022-08-20', NULL, NULL, 2, NULL),
(8, '2022-09-20', NULL, NULL, 3, NULL),
(9, '2022-07-15', '2022-07-15', 124.99, 1, 'dinheiro'),
(9, '2022-08-15', '2022-07-15', 124.99, 2, 'pix'),
(10, '2022-07-15', '2022-06-15', 589.69, 0, 'dinheiro');


INSERT INTO Atividades_Realizadas(codigo_ordem_servico, codigo_servico, codigo_atividade, id_funcionario) VALUES
(1,1,1,1), (1,1,2,2), (1,1,3,6), (1,1,4,6),
(2,6,15,2), (2,6,16,7), (2,6,17,7), (2,6,18,2), (2,6,19,7), (2,6,20,7),(2,6,21,7),
(3,3,5,2), (3,3,6,9),
(4,6,15,1), (4,6,16,7), (4,6,17,7), (4,6,18,2), (4,6,19,7), (4,6,20,7), (4,6,21,7),
(5,5,10,1), (5,5,11,8), (5,5,12,1), (5,5,13,8), (5,5,14,1),
(6,1,1,1), (6,1,2,1), (6,1,3,4), (6,1,4,6),
(6,3,5,2), (6,3,6,9),
(7,6,15,1), (7,6,16,7), (7,6,17,7), (7,6,18,2), (7,6,19,2), (7,6,20,1), (7,6,21,7),
(8,1,1,2), (8,1,2,2), (8,1,3,6), (8,1,4,6),
(8,3,5,9), (8,3,6,9),
(9,5,10,2), (9,5,11,7), (9,5,12,1), (9,5,13,6), (9,5,14,7),
(9,1,1,2), (9,1,2,2), (9,1,3,6), (9,1,4,6),
(10,1,1,1), (10,1,2,2), (10,1,3,6), (10,1,4,6);


INSERT INTO Atividades_Realizadas(codigo_ordem_servico, codigo_servico, codigo_atividade, situacao) VALUES
(10,1,3,'iniciado'), (10,1,2,'em espera'),
(11,6,15,'iniciado'), (11,6,16,'iniciado'), (11,6,17,'em espera'), (11,6,18,'em espera'), (11,6,19,'em espera'), (11,6,20,'em espera'), (11,6,21,'em espera'),
(12,5,10,'iniciado'), (12,5,11,'iniciado'), (12,5,12,'em espera'), (12,5,13,'em espera'), (12,5,14,'em espera'),
(13,4,7,'iniciado'), (13,4,8,'em espera'), (13,4,9,'em espera'),
(14,3,5,'em espera'),(14,3,6,'iniciado'),
(15,2,5,'em espera'),(15,2,6,'em espera');