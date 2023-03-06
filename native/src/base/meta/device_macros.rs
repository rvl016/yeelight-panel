macro_rules! device_action_decorator {
    (
        $(#[$meta:meta])*
        $vis:vis struct $name:ident {
            $($inner_tokens:tt)*
        }
    ) => {
        $(#[$meta])*
        $vis struct $name {
            pub next: std::sync::Arc<dyn DeviceAction>,
            $($inner_tokens)*
        }
    };
    (
        $(#[$meta:meta])*
        $vis:vis struct $name:ident
    ) => {
        $(#[$meta])*
        $vis struct $name {
            pub next: std::sync::Arc<dyn DeviceAction>,
        }
    };
    (
        $(#[$meta:meta])*
        $vis:vis struct $name:ident<$($tt:tt),*> {
            $($inner_tokens:tt)*
        }
    ) => {
        $(#[$meta])*
        $vis struct $name<$($tt),*> {
            pub next: std::sync::Arc<dyn DeviceAction>,
            $($inner_tokens)*
        }
    };
}

pub(crate) use device_action_decorator;