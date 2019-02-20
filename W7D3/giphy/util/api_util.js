export const fetchSearchGiphys = (searchTerm) => (
    $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=RIS82samn9INm0DmYk55vcnPtg1zRCee&limit=2`
    })
) 