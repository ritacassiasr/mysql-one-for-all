SELECT 
    FORMAT(MIN(p.valor), 2) AS faturamento_minimo,
    FORMAT(MAX(p.valor), 2) AS faturamento_maximo,
    FORMAT(AVG(p.valor), 2) faturamento_medio,
    FORMAT(SUM(p.valor), 2) AS faturamento_total
FROM
    SpotifyClone.planos AS p
       INNER JOIN
    SpotifyClone.usuarios AS u ON u.id_plano = p.id_plano;