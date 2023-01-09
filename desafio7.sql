SELECT ar.nome_artista AS artista, al.nome_album AS album, COUNT(s.id_usuario) AS seguidores
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.seguindo AS s
ON ar.id_artista = s.id_artista
GROUP BY s.id_artista, nome_album
ORDER BY seguidores DESC, artista ASC, album ASC;