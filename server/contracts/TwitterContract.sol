pragma solidity 0.8.4;

contract TwitterContract{

    event AddTweet(address recipient, uint tweetId);
    event DeleteTweet(uint tweetId, bool isDeleted);

    struct Tweet {
        uint id;
        address username;
        string tweetText;
        bool isDeleted;
    }

    Tweet[] private tweets;

    mapping(uint256 => address) tweetToOwner;

    function addTweet(string memory tweetText, bool isDeleted) external{
        uint tweetid=tweets.length;
        tweets.push(Tweet(tweetid, msg.sender, tweetText, isDeleted));
        tweetToOwner[tweetid]= msg.sender;
        emit AddTweet(msg.sender, tweetid);
    }

    function getAllTweets() external view returns (Tweet[] memory){
        Tweet[] memory temporary = new Tweet[](tweets.length);
        uint counter=0;
        for(uint i=0; i<tweets.length;i++){
            if(tweets[i].isDeleted==false){
                temporary[counter]= tweets[i];
                counter++;
            }
        }

        Tweet[] memory result = new Tweet[](counter);
        for(uint i=0; i<tweets.length;i++){
            result[i]=temporary[i];
        }
        return result;

    }

    function getMyTweets()external view returns(Tweet[] memory){
        Tweet[] memory temporary = new Tweet[](tweets.length);
        uint counter=0;
        for(uint i=0; i<tweets.length;i++){
            if(tweetToOwner[i]==msg.sender && tweets[i].isDeleted==false){
                temporary[counter]= tweets[i];
                counter++;
            }
        }

        Tweet[] memory result = new Tweet[](counter);
        for(uint i=0; i<tweets.length;i++){
            result[i]=temporary[i];
        }
        return result;
    }

    function deleteTweet(uint tweetId, bool isDeleted) external{
        if(tweetToOwner[tweetId]==msg.sender){
            tweets[tweetId].isDeleted= isDeleted;
            emit DeleteTweet(tweetId, isDeleted);
        }
    }

}

