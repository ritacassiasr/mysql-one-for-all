SELECT u.nome AS usuario, COUNT(r.id_usuario) AS qt_de_musicas_ouvidas, ROUND(SUM(c.duracao_segundo) / 60,2) AS total_minutos
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.reproducoes AS r
ON u.id_usuario = r.id_usuario
INNER JOIN SpotifyClone.cancoes AS c
ON r.id_cancao = c.id_cancao
GROUP BY nome
ORDER BY nome;