USE [Chinook]
GO

--	01
--------------------------------------------------------------
--	wyświetlić wszystkie albumy Artystów:
--	AC/DC, Black Sabbath, Metallica

	SELECT
		[a].[Name]
	,	[a2].[Title]
	FROM
		[dbo].[Artist] AS [a]
	INNER JOIN [dbo].[Album] AS [a2] ON [a2].[ArtistId] = [a].[ArtistId]
	WHERE a.[Name] IN ('AC/DC','Black Sabbath','Metallica');

--	02
--------------------------------------------------------------
--	wyświetlić wszystkie piosenki Artystów:
--	AC/DC, Black Sabbath, Metallica

	SELECT
		[a].[Name]
	,	[a2].[Title]
	,	[t].[TrackId]
	,	[t].[Name]
	FROM
		[dbo].[Artist] AS [a]
	INNER JOIN [dbo].[Album] AS [a2] ON [a2].[ArtistId] = [a].[ArtistId]
	INNER JOIN [dbo].[Track] AS [t] ON [t].[AlbumId] = [a2].[AlbumId]
	WHERE a.[Name] IN ('AC/DC','Black Sabbath','Metallica');

--	03
--------------------------------------------------------------
--	wyświetlić wszystkie gatunki muzyczne, do których przypisane zostały piosenki Artystów:
--	Amy Winehouse, Audioslave, Guns N' Roses

--	04
--------------------------------------------------------------
--	Korzystając z tabel:
	--	[dbo].[Invoice] - Faktura
	--	[dbo].[InvoiceLine]	- Linie Faktury
--	ustalić, ile łącznie wydali w naszej firmie klienci:
	--	Frank	Harris
	--	Frank	Ralston

	SELECT
		[c].[FirstName]
	,	[c].[LastName]
	,	[amount]	= SUM([il].[UnitPrice] * [il].[Quantity])
	FROM
		[dbo].[Customer]			AS [c]
	INNER JOIN [dbo].[Invoice] AS [i] ON [i].[CustomerId] = [c].[CustomerId]
	INNER JOIN [dbo].[InvoiceLine] AS [il] ON [il].[InvoiceId] = [i].[InvoiceId]
	WHERE		(			[c].[FirstName]		= 'Frank'			AND [c].[LastName]	= 'Harris'		)
		OR		(			[c].[FirstName]		= 'Frank'			AND [c].[LastName]	= 'Ralston'		)
	GROUP BY
		[c].[FirstName]
	,	[c].[LastName];