use std::iter::FromIterator;
use std::option::Option;

pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
    len: usize,
}

#[derive(Clone)]
pub struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T: Copy> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: None, len: 0 }
    }

    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }

    pub fn len(&self) -> usize {
        self.len
    }

    pub fn push(&mut self, element: T) {
        self.head = Some(Box::new(Node {
            data: element,
            next: std::mem::replace(&mut self.head, None),
        }));
        self.len += 1;
    }

    pub fn pop(&mut self) -> Option<T> {
        if let Some(n) = self.head.clone() {
            self.head = n.next;
            self.len -= 1;
            Some(n.data)
        } else {
            None
        }
    }

    pub fn peek(&self) -> Option<&T> {
        match &self.head {
            None => None,
            Some(x) => Some(&x.data),
        }
    }

    #[must_use]
    pub fn rev(mut self) -> SimpleLinkedList<T> {
        let mut result: SimpleLinkedList<T> = SimpleLinkedList::new();
        while let Some(x) = &mut self.pop() {
            result.push(*x)
        }
        result
    }
}

impl<'a, T: Copy> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(iter: I) -> Self {
        let mut i = iter.into_iter();
        let mut result = SimpleLinkedList::new();
        while let Some(x) = i.next() {
            result.push(x);
        }
        result
    }
}

// In general, it would be preferable to implement IntoIterator for SimpleLinkedList<T>
// instead of implementing an explicit conversion to a vector. This is because, together,
// FromIterator and IntoIterator enable conversion between arbitrary collections.
// Given that implementation, converting to a vector is trivial:
//
// let vec: Vec<_> = simple_linked_list.into_iter().collect();
//
// The reason this exercise's API includes an explicit conversion to Vec<T> instead
// of IntoIterator is that implementing that interface is fairly complicated, and
// demands more of the student than we expect at this point in the track.

impl<'a, T: Copy> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut v = Vec::new();
        while let Some(x) = linked_list.pop() {
            v.push(x);
        }
        v.reverse();
        v
    }
}
