var getAllOrders = function (id) {

    return function (req, res, next) {
        dal.Cart.find({
            checkedOut: true
        }, null,  {sort: '-createdAt'}).populate({
            path: 'items.tool',
            select: 'name'
        }).populate({
            path: 'user',
            select: 'name mail'
        }).then(function (carts) {
            req.carts = carts;
            return next();
        });
    };
};

module.exports = getAllOrders;
