SELECT c.nome_cancao AS cancao, COUNT(r.id_usuario) AS reproducoes
FROM SpotifyClone.reproducoes AS r
INNER JOIN SpotifyClone.cancoes AS c
ON r.id_cancao = c.id_cancao
GROUP BY nome_cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;