SELECT 
    COUNT(u.nome) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.reproducoes AS r
        INNER JOIN
    SpotifyClone.usuarios AS u ON r.id_usuario = u.id_usuario
GROUP BY u.nome
HAVING u.nome = 'Barbara Liskov';