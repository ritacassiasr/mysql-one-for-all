SELECT 
    u.nome AS usuario,
    IF(MAX(YEAR(r.data_reproducao)) >= '2021',
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.usuarios AS u
        INNER JOIN
    SpotifyClone.reproducoes AS r ON u.id_usuario = r.id_usuario
GROUP BY nome
ORDER BY nome;