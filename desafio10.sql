SELECT 
    c.nome_cancao AS nome, COUNT(r.id_usuario) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.reproducoes AS r ON r.id_cancao = c.id_cancao
        INNER JOIN
    SpotifyClone.usuarios AS u ON u.id_usuario = r.id_usuario
        INNER JOIN
    SpotifyClone.planos AS p ON p.id_plano = u.id_plano
GROUP BY nome_cancao , u.id_plano , p.nome_plano
HAVING p.nome_plano = 'gratuito'
    OR p.nome_plano = 'pessoal'
ORDER BY c.nome_cancao;