--Quel est le nom de l’artiste pour l’album titré "Fear Of The Dark" ?
SELECT
    artists.Name,
    artists.ArtistId
FROM
    albums
    JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE
    albums.Title = 'Fear Of The Dark';

--Quels sont les différents tarifs unitaires des musiques ?
SELECT DISTINCT
    UnitPrice
FROM
    tracks;

-- Classer par ordre décroissant le nombre de chanson par genre
SELECT
    genres.Name AS Genre,
    COUNT(tracks.TrackId) AS Songs
FROM
    genres
    JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY
    genres.GenreId
ORDER BY
    Songs DESC;

-- Quel est le titre de la chanson la plus longue ? 
-- Et quel est le nom de l’artiste ?
SELECT
    Titre,
    Artiste,
    MAX(Duree)
FROM
    (
        SELECT
            tracks.Name AS Titre,
            artists.Name AS Artiste,
            tracks.Milliseconds AS Duree
        FROM
            tracks
            JOIN albums ON tracks.AlbumId = albums.AlbumId
            JOIN artists ON albums.ArtistId = artists.ArtistId
        ORDER BY
            tracks.Milliseconds DESC
    );

/*Quel est le nom du client, le montant
global de ses commandes et son pays
pour le client ayant le montant total
de commandes le plus élevé ?*/

SELECT
    NomDuClient,
    Pays,
    MAX(Montant)
FROM
    (
        SELECT
            customers.LastName AS NomDuClient,
            customers.Country AS Pays,
            SUM(invoices.Total) AS Montant
        FROM
            customers
            JOIN invoices ON customers.CustomerId = invoices.CustomerId
        GROUP BY
            customers.CustomerId
        ORDER BY
            Montant DESC
    );

--Afficher les titres de la playlist "Grunge" ?

SELECT playlists.Name AS Playlist, tracks.Name AS Titre
FROM playlists
JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
WHERE playlists.Name = 'Grunge';

--Quels titres d’albums comportent les mots : "Fairy" ou "Wind"

SELECT Title AS Titre
FROM albums
WHERE Title LIKE '%Fairy%';
