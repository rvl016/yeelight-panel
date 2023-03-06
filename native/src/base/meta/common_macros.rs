macro_rules! box_func {
    ($expr:expr) => {
        || {
            Box::pin($expr)
        }
    };
}

pub(crate) use box_func;
